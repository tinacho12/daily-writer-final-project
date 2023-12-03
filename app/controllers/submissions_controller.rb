class SubmissionsController < ApplicationController
  def home
    render({ :template => "submissions/home" })
  end

  def write
    render({ :template => "submissions/write" })
  end

  def submit
    the_submission = Submission.new
    the_submission.body = params.fetch("query_body")
    the_submission.word_count = params.fetch("query_word_count")
    the_submission.writer_id = params.fetch("writer_id")

    if the_submission.valid?
      the_submission.save
      redirect_to("/submissions", { :notice => "Submission created successfully." })
    else
      redirect_to("/submissions", { :alert => the_submission.errors.full_messages.to_sentence })
    end
  end

  def index
    render({ :template => "submissions/home" })
  end
end
