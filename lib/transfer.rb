require 'pry'

class Transfer

  attr_accessor :status, :last_transaction
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @last_transaction = 0
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if status == "pending" && sender.balance >= amount && sender.status == "open" && receiver.status == "open"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete" && receiver.balance >= amount && receiver.status == "open" && sender.status == "open"
      receiver.balance = receiver.balance - amount
      sender.balance = sender.balance + amount
      @status = "reversed"
    end
  end

end
