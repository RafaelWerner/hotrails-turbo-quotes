class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = Quote.all
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: I18n.t("quotes.successfull_message.create")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: I18n.t("quotes.successfull_message.update")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: I18n.t("quotes.successfull_message.destroy")
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
