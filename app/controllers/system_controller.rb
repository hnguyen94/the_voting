# frozen_string_literal: true

class SystemController < ApplicationController
  def alive
    render text: File.read('virtual/lb_check/alive.txt')
  end
end
