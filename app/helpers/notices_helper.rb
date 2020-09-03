module NoticesHelper
  def new_notice_count(user)
    notice = Notice.where(reciever_id: user.id, check: nil).count
    if notice == 0
      true
    else
      false
    end
  end
end
