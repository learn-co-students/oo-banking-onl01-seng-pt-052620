class Transfer
  
  attr_accessor :sender, :receiver, :status, :transer_amount
  def initialize
    @sender = sender
    @receiver = receiver
    status = "pending"
    @transer_amount = transfer_amount
  end

  
end


require "pry"

class Transfer
  attr_accessor :sender, :receiver, :status, :amount 

  def initialize(sender, receiver, status="pending", amount)
      @sender = sender 
      @receiver = receiver  
      @status = status
      @amount = amount  
  end 

  def valid?
    sender.valid? && receiver.valid? 

  end
  
  def execute_transaction 
    # binding.pry 
    if self.sender.balance < self.amount  || self.status != "pending" || !self.valid? 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
     self.receiver.balance += self.amount  
      self.sender.balance -= self.amount  
      self.status = "complete" 
  end 
end 


  def reverse_transfer 
    if self.receiver.balance < self.amount  || self.status != "complete" || !self.valid? 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else  
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount   
      self.status = "reversed" 
  end 
  end 


end
