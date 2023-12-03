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
    the_submission.word_count = calculate_word_count(params.fetch("query_body"))
    the_submission.writer_id = params.fetch("writer_id")
  
    if the_submission.valid?
      the_submission.save
      redirect_to("/submissions", { :notice => "Submission created successfully." })
    else
      redirect_to("/submissions", { :alert => the_submission.errors.full_messages.to_sentence })
    end
  end
  
  def index
    matching_submissions = Submission.all

    @list_of_submissions = matching_submissions.order({ :created_at => :desc })
    render({ :template => "submissions/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_submissions = Submission.where({ :id => the_id })

    @the_submission = matching_submissions.at(0)

    render({ :template => "submissions/show" })
  end

  def update
    the_id = params.fetch("path_id")
    the_submission = Submission.where({ :id => the_id }).at(0)

    the_submission.body = params.fetch("query_body")
    the_submission.word_count = calculate_word_count(params.fetch("query_body"))
    the_submission.writer_id = params.fetch("query_user_id")

    if the_submission.valid?
      the_submission.save
      redirect_to("/submissions/#{the_submission.id}", { :notice => "Submission updated successfully."} )
    else
      redirect_to("/submissions/#{the_submission.id}", { :alert => the_submission.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_submission = Submission.where({ :id => the_id }).at(0)

    the_submission.destroy

    redirect_to("/submissions", { :notice => "Submission deleted successfully."} )
  end

  private
  
  def calculate_word_count(text)
    text.split(/\s+/).select { |word| word.length.positive? }.size
  end  

end
