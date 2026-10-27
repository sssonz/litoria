class CommentsController < ApplicationController
  before_action :require_login

  def create
    work = Work.find(params[:work_id])

    commentable = if params[:chapter_id].present?
      work.chapters.find(params[:chapter_id])
    else
      work
    end

    comment = current_user.comments.build(
      body: comment_params[:body],
      commentable: commentable
    )

    destination = if commentable.is_a?(Chapter)
      work_chapter_path(work, commentable)
    else
      work_path(work)
    end

    if comment.save
      redirect_to destination,
                  notice: "Комментарий успешно добавлен.",
                  status: :see_other
    else
      redirect_to destination,
                  alert: comment.errors.full_messages.to_sentence,
                  status: :see_other
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to comment_destination(@comment),
                  notice: "Комментарий успешно изменён.",
                  status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    unless @comment.user_id == current_user.id || admin_signed_in?
      head :forbidden
      return
    end

    destination = comment_destination(@comment)

    @comment.destroy!

    redirect_to destination,
                notice: "Комментарий успешно удалён.",
                status: :see_other
  end

  private

  def require_login
    return if current_user

    redirect_to login_path,
                alert: "Для работы с комментариями необходимо войти."
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def comment_destination(comment)
    if comment.commentable.is_a?(Chapter)
      chapter = comment.commentable
      work_chapter_path(chapter.work, chapter)
    else
      work_path(comment.commentable)
    end
  end
end
