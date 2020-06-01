def entrance(env, start_response):
    data = str(env['RAW_URI'])
    data = bytes('\n'.join(data[data.rindex('/')+1:].split('&')), encoding='UTF-8')
    start_response('200 OK', [('Content-Type', 'text/plain')])
    return iter([data])
