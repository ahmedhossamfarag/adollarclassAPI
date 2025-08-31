class UsersController < ApplicationController
  # GET /users/educators
  def educators
    render json: User.educator
  end

  # GET /users/mentors
  def mentors
    render json: User.mentor
  end

  # GET /users/counselors
  def counselors
    render json: User.counselor
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_content
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :nickname, :experience, :email, :role, :specialty, :qualifications, :password, :password_confirmation, :portfolio ])
    end
end
