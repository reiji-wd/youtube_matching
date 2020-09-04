module NoticesHelper
  def new_notice_count(user)
    notice_count = Notice.where(reciever_id: user.id, check: nil).count
    if notice_count != 0
      content_tag(:div, notice_count, class: 'new-notice-count')
    end
  end
end
