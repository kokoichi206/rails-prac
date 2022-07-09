module ApplicationHelper
  
  # 完全なタイトル
  # providerに定義があるときとない時で | の有無を変えるなど
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
