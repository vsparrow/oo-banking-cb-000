class Transfer

  attr_accessor :sender,:receiver,:amount,:status

  def initialize(sender,receiver,amount)
    # @name=name
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end #initialize

  def execute_transaction
    # if  @sender.valid? == false
    #   return "Transaction rejected. Please check your account balance."
    # elsif
    if  @status == "pending" #&& @receiver.valid?
      if @sender.valid? == false
         "Transaction rejected. Please check your account balance."
      elsif @sender.balance <= @amount
        @status="rejected"
        "Transaction rejected. Please check your account balance."

      else
        # puts "*** ********sender.account#{@sender.valid?}"
        @sender.balance = @sender.balance - amount
        @receiver.balance = @receiver.balance + amount
        @status = "complete"
      end #inner if
    end #if
  end

  def reverse_transfer
    if @status=="complete"
      @sender.balance = @sender.balance + amount
      @receiver.balance = @receiver.balance - amount
      @status="reversed"
    end
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end
end #class
