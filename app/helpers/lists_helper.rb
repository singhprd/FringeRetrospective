# frozen_string_literal: true

module ListsHelper
  def friend_action(user)
    # if !current_user.friends_with?(user)
    #   return content_tag(:span, "Friend", {
    #     data: {
    #       action: "click->friend-list#friendUser",
    #       user_id: user.id,
    #     },
    #     style: "cursor: pointer;",
    #     class: "pull-right",
    #   })
    # end
  end

  def separator
    return content_tag(:span, "&nbsp;|&nbsp;".html_safe, {class: "pull-right"})
  end

  def user_list_action(user)
    if user == current_user
      return
    end

    if current_user == @list.owner
      return content_tag(:span, "Remove", {
        data: {
          action: "click->friend-list#removeUser",
          user_id: user.id,
        },
        style: "cursor: pointer;",
        class: "pull-right",
      })
    end
  end
end
