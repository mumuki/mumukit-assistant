class Mumukit::Assistant::Rule::Base
  attr_accessor :message
  def initialize(message)
    @message = message
  end

  def message_for(retries)
    message.call(retries)
  end
end