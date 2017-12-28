# rubocop:disable Metrics/LineLength, ClassLength
class PagesController < ApplicationController
  def home
    if user_signed_in?
      if current_user.user_type == 'researcher'
        
      else
        @current_game_screen = current_user.players.sort_by(&:id).last
        if current_user.user_status == 'playing'
          redirect_to player_path(@current_game_screen)
        end
      end

    else
      redirect_to new_user_session_path
    end
  end

  def demo_screenshots
  end

  def activate_tut0
    user = User.find(params[:user_id])
    user.tut0 = true
    user.save
    flash[:notice] = 'Read and complete the consent form below.'
    redirect_to request.referrer
  end

  def activate_tut1
    user = User.find(params[:user_id])
    if params[:a1] == '1' && params[:a2] == '1' && params[:b1] == '1' && params[:b2] == '1'
      user.tut1 = true
      user.save
      flash[:notice] = 'Great you are on track! Let\'s understand the game now.'
    else
      user.tut1 = false
      user.failed_attempt_count += 1
      user.save
      flash[:notice] = '!!! Some of your answers were incorrect. Please answer carefully.'
    end
    redirect_to request.referrer
  end

  def activate_tut2
    user = User.find(params[:user_id])
    if params[:a3] == '1' && params[:a4] == '1'
      user.tut2 = true
      user.save
      flash[:notice] = 'Great you are on track! Let\'s understand the playing now.'
    else
      user.tut2 = false
      user.failed_attempt_count += 1
      user.save
      flash[:notice] = '!!! Some of your answers were incorrect. Please answer carefully.'
    end
    redirect_to request.referrer
  end

  def activate_tut3
    user = User.find(params[:user_id])
    if params[:a5] == '1' && params[:a6] == '1' && params[:a7] == '1'
      user.tut3 = true
      user.user_status = 'active'
      user.save
      flash[:notice] = 'Great you are done with Stage 1 of the study!'
    else
      user.tut3 = false
      user.failed_attempt_count += 1
      user.save
      flash[:notice] = '!!! Some of your answers were incorrect. Please answer carefully.'
    end
    redirect_to request.referrer
  end

  def activate_user
    user = User.find(params[:user_id])
    user.player_name = params[:full_name]
    user.gender = params[:gender]
    user.age = params[:actual_age]
    user.valid_age = params[:age]
    user.valid_read = params[:read]
    user.valid_consent = params[:consent]
    user.save

    if user.valid_age && user.valid_read && user.valid_consent && user.player_name != ''
      flash[:notice] = 'Let\'s begin the Tutorial'
    else
      user.player_name = ''
      user.gender = ''
      user.age = 18
      user.valid_age = false
      user.valid_read = false
      user.valid_consent = false
      user.user_status = 'offline'
      user.save
      flash[:notice] = 'Some fields were not filled properly - please refill the form and submit again.'
    end

    redirect_to request.referrer
  end

  def inactivate_user
    u = User.find(params[:user_id])
    u.user_status = 'inactive'
    u.save
    flash[:notice] = 'Player deactivated'
    redirect_to request.referrer
  end

  def go_offline_now
    u = User.find(params[:user_id])
    u.user_status = 'offline'
    u.player_name = ''
    u.gender = ''
    u.age = 18
    u.failed_attempt_count = 0
    u.valid_age = false
    u.valid_read = false
    u.valid_consent = false
    u.tut0 = false
    u.tut1 = false
    u.tut2 = false
    u.tut3 = false
    u.save
    flash[:notice] = 'Thank you for playing!'
    sign_out u
    redirect_to root_path
  end

end
