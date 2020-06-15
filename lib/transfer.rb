require 'pry'

class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    valid_accts = @sender.valid? && @receiver.valid? ? true : false
    valid_accts && @status == "pending" ? true : false
  end

  def execute_transaction
    if self.valid? && @sender.balance >= @amount
      @receiver.deposit(@amount)
      @sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      @status = "reversed"
    end
  end

end