from flask import Flask, jsonify, request
from prometheus_client import Counter, generate_latest, REGISTRY, Gauge
from prometheus_client.exposition import MetricsHandler

app_name = 'comentarios'
app = Flask(app_name)
app.debug = True

# Definindo métricas Prometheus
comments_counter = Counter('comments_created', 'Number of comments created')
comments_gauge = Gauge('comments_total', 'Total number of comments')

comments = {}


@app.route('/api/comment/new', methods=['POST'])
def api_comment_new():
    request_data = request.get_json()

    email = request_data['email']
    comment = request_data['comment']
    content_id = '{}'.format(request_data['content_id'])

    new_comment = {
            'email': email,
            'comment': comment,
            }

    if content_id in comments:
        comments[content_id].append(new_comment)
    else:
        comments[content_id] = [new_comment]

    comments_counter.inc()  # Incrementando a métrica de contador
    comments_gauge.set(len(comments))  # Atualizando a métrica de gauge

    message = 'comment created and associated with content_id {}'.format(content_id)
    response = {
            'status': 'SUCCESS',
            'message': message,
            }
    return jsonify(response)


@app.route('/api/comment/list/<content_id>')
def api_comment_list(content_id):
    content_id = '{}'.format(content_id)

    if content_id in comments:
        return jsonify(comments[content_id])
    else:
        message = 'content_id {} not found'.format(content_id)
        response = {
                'status': 'NOT-FOUND',
                'message': message,
                }
        return jsonify(response), 404


# Endpoint para as métricas Prometheus
@app.route('/metrics')
def prometheus_metrics():
    return generate_latest(REGISTRY), 200, {'Content-Type': 'text/plain'}

# Registro do manipulador MetricsHandler para garantir que o Flask possa servir as métricas corretamente
app.add_url_rule('/metrics', 'metrics', view_func=prometheus_metrics)


if __name__ == '__main__':
    app.run()
