class Mongo::Collection
  alias :old_find :find

  def find(find = {}, params = {})
    params[:limit] ||= 10
    total = params[:skip].to_i + params[:limit].to_i
    cursor = old_find(find, params)

    $last_find = find #Pensar numa forma melhor de fazer isso...
    $last_collection = self
    $last_print = total

    return cursor
  end
end
