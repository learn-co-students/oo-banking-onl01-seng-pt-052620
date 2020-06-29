require 'pry'

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == "pending" && self.valid? == true && sender.balance >= self.amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" && self.valid? == true && sender.balance >= self.amount
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

end
