require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else
      false
    end
  end

 def execute_transaction
    if valid? && @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      
    else #!@sender.valid? || @sender.balance < @amount
      binding.pry
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    
    #else 
     # @status == "complete"
      #puts "Transaction was already excuted"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
    @sender.deposit(@amount)
    @receiver.deposit(@amount * -1)
    @status = "reversed"
    end
  end
end
