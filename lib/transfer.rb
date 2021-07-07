require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount, status = 'pending')
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid? and receiver.valid?
  end

  def execute_transaction
    if valid? and sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif valid? and self.status != "complete"
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount)
      receiver.withdraw(amount)
      self.status = "reversed"
    end
  end


end
