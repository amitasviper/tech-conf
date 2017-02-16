module ApplicationHelper
  def full_title(title='')
    base_title = 'TechConf! Never miss Conferences|Meetups|Talks'
    if title.empty?
      base_title
    else
      title + ' | ' + base_title
    end
  end
end
