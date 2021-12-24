# frozen_string_literal: true

class HypothesisController < ApplicationController
  def input
    render layout: false
  end

  def view
    new_num = Number.new
    results = Number.all

    number = params[:number]
    if (results.find_by number: number).nil?
      if number.count('a-zA-Zа-яА-Я').positive?
        @result = nil
      else
        @result = proccessor(number).map(&:to_s)
        new_num.number = number.to_i
        @result.map(&:to_i).each_index do |i|
          new_num.results << Result.new(result: @result[i], iteration: i + 1)
        end
        new_num.save
        tmp = new_num.results.pluck(:result)
        @result = ["0 - #{number}"]
        tmp.each_index do |i|
          @result << "#{i + 1} - #{tmp[i]}"
        end
        @result
      end
    else
      tmp = (results.find_by number: number).results.pluck(:result)
      @result = ["0 - #{number}"]
      tmp.each_index do |i|
        @result << "#{i + 1} - #{tmp[i]}"
      end
      @result
    end

    respond_to do |format|
      format.html
      format.json do
        render json: { type_result: @result.class.to_s, value_result: @result }
      end
    end
  end

  private

  def proccessor(number)
    result = []
    while number.to_s != number.to_s.reverse
      number = number.to_i + number.to_s.reverse.to_i
      result << number
    end
    result
  end

end
