class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :challenge_statement
  load_and_authorize_resource :submission, through: :challenge_statement

  # GET /submit
  # GET /submit.json

  # GET /submit/1
  # GET /submit/1.json
  def show
  end

  # GET /submit/new
  def new
    @challenge_statement = ChallengeStatement.find(params[:challenge_statement_id])
    @submission = @challenge_statement.submissions.new
    @submission.user_id = current_user.id
  end

  # GET /submit/1/edit
  def edit
  end

  # POST /submit
  # POST /submit.json
  def create
    @challenge_statement = ChallengeStatement.find(params[:challenge_statement_id])
    @submission = @challenge_statement.submissions.new(submission_params)
    #@submission.assign_attributes( {:challenge_statement_id => @challenge_statement.id} )
    #authorize! :create, @submission
    @submission.user_id = current_user.id
    respond_to do |format|
      if @submission.save
        SubmissionMailer.submit_upload(@submission).deliver_now
        format.html { redirect_to @challenge_statement, notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submit/1
  # PATCH/PUT /submit/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        SubmissionMailer.submit_upload(@submission).deliver_now
        format.html { redirect_to @challenge_statement, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submit/1
  # DELETE /submit/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to @challenge_statement, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @challenge_statement = ChallengeStatement.find(params[:challenge_statement_id])
      @submission = @challenge_statement.submissions.find(params[:id])
    end


    def has_submit?
      return if Submission.exists?(user: user, challenge_statement_id: challenge_statement_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:title, :file)
    end
end
