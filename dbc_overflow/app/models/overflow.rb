class Overflow
  include HTTParty

  def questions
    get('/questions')
  end

  def create_question(params)
    post('/questions', params)
  end

  def show_question(question_id)
    get("/questions/#{question_id}")
  end

  def destroy(question_id)
    delete("/questions/#{question_id}")
  end

  def edit(question_id, params)
    put("/questions/#{question_id}", params)
  end

  private
  def get(url)
    HTTParty.get("http://127.0.0.1:3001/#{url}").parsed_response
  end

  def post(url, params={}, headers={})
    HTTParty.post("http://127.0.0.1:3001/#{url}", body: params, headers: headers).parsed_response
  end

  def delete(url)
    HTTParty.delete("http://127.0.0.1:3001/#{url}").parsed_response
  end

  def put(url, params={}, headers={})
    HTTParty.put("http://127.0.0.1:3001/#{url}", body: params, headers: headers).parsed_response
  end

end


