class UsersController < ApplicationController

  def payment
    @user = current_user
    @user.address || @user.build_address
    @user.payment || @user.build_payment
  end

  def update
    if current_user.update(user_params)
      redirect_to users_payment_path, notice: "Success"
    else
      redirect_to users_payment_path, notice: "failed"
    end
  end


  def user_params
    params.require(:user).permit(payment_attributes: payment_attrs, address_attributes: address_attrs)
  end

  def payment_attrs
    %i[low_balance card_number card_name cvc valid_month valid_year]
  end

  def address_attrs
    %i[company first_name last_name street_address apartment city state postal_code country]
  end
end
