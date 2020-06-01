def entrance(env, start_response):
    data = str(env['QUERY_STRING'])
    data = bytes('\n'.join(data.split('&')), encoding='UTF-8')
    start_response('200 OK', [('Content-Type', 'text/plain')])
    return iter([data])
