class BankAccount

  attr_accessor :balance, :status
  attr_reader :name# ,:status

  def initialize(name=nil,balance=1000,status="open")
    @name=name
    @balance=balance
    @status=status
  end #initialize

  def close_account
    @status="closed"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end


end #class
