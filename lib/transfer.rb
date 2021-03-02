require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << self
  end

  def valid?
    if receiver.valid? && sender.valid? == true
      true
    else
      false
    end

  end

  def execute_transaction
    if receiver.valid? && sender.balance > amount && receiver.balance && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    elsif sender.balance < amount
      
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif receiver.valid? == false
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  end



  def reverse_transfer
    execute_transaction
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
    # if receiver.valid? && sender.balance > amount && receiver.balance && @status == "pending"
    #   sender.balance -= amount
    #   receiver.balance += amount
    #   @status = "complete"
    # elsif sender.balance < amount 
    #   sender.balance += amount
    #   receiver.balance -= amount
      
    #   @status = "rejected"
    #   "Transaction rejected. Please check your account balance."
    # elsif receiver.valid? == false
    #   "Transaction rejected. Please check your account balance."
    #   @status = "rejected"
    #   "Transaction rejected. Please check your account balance."
    # end
  end
  # self.status = rejected

  def self.all
    @@all
  end
end
b1 = BankAccount.new("Devante")
b2 = BankAccount.new("Alex")
b3 = BankAccount.new("Andre")

t1 = Transfer.new(b1, b2, 25)
t2 = Transfer.new(b3, b2, 30)
t3 = Transfer.new(b2, b3, 50)

# binding.pry
# 0