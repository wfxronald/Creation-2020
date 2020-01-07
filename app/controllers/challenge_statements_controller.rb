class ChallengeStatementsController < ApplicationController
  before_action :set_challenge_statement, only: [:show, :edit, :update, :destroy, :join]
  load_and_authorize_resource

  # GET /challenge_statements
  # GET /challenge_statements.json
  def index
    @challenge_statements = ChallengeStatement.all
  end

  def submit
    @challenge_statements = ChallengeStatement.all
    @challenge_statement = nil
    @submission = nil
  end

  # GET /challenge_statements/1
  # GET /challenge_statements/1.json
  def show
    if user_signed_in?
      if current_user.admin
        @submissions = @challenge_statement.submissions.all
      else
        @submissions = @challenge_statement.submissions.where(:user_id => current_user.id)
      end
    end
  end

  # GET /challenge_statements/new
  def new
    @challenge_statement = current_user.challenge_statements.new
  end

  # GET /challenge_statements/1/edit
  def edit
  end

  # POST /challenge_statements
  # POST /challenge_statements.json
  def create
    @challenge_statement = current_user.challenge_statements.new(challenge_statement_params)

    respond_to do |format|
      if @challenge_statement.save
        format.html { redirect_to @challenge_statement, notice: 'Challenge statement was successfully created.' }
        format.json { render :show, status: :created, location: @challenge_statement }
      else
        format.html { render :new }
        format.json { render json: @challenge_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenge_statements/1
  # PATCH/PUT /challenge_statements/1.json
  def update
    respond_to do |format|
      if @challenge_statement.update(challenge_statement_params)
        format.html { redirect_to @challenge_statement, notice: 'Challenge statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge_statement }
      else
        format.html { render :edit }
        format.json { render json: @challenge_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenge_statements/1
  # DELETE /challenge_statements/1.json
  def destroy
    @challenge_statement.destroy
    respond_to do |format|
      format.html { redirect_to challenge_statements_url, notice: 'Challenge statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    if user_signed_in?
      current_user.joined_challenge_statement.push(@challenge_statement.id)
      current_user.save!
      redirect_to challenge_statement_path(@challenge_statement)
    else
      redirect_to new_user_session_path, notice: "Please sign in to continue."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge_statement
      @challenge_statement = ChallengeStatement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_statement_params
      params.require(:challenge_statement).permit(:title, :description, :zip)
    end
end
