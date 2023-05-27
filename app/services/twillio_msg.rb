class TwilioTextMessenger
  attr_reader :message

  def initialize(message, number)
    @message = message
    @number = number
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create(
      {
        from: ENV.fetch('TWILIO_PHONE_NUMBER', nil),
        to:   "+55#{@number}",
        body: @message
      }
    )
  end
end
