#coding: utf-8

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
  
  test "factory girl" do
    member = Factory(:member)
    p member.full_name
    assert_equal "Yamada Taro", member.full_name
  end

  test "authenticate fail" do
    member = Factory(:member, name: "taro",
      password: "happy", password_confirmation: "happy")
    assert_nil Member.authenticate("taro", "lucky")
  end

  test "authenticate correct" do
    member = Factory(:member, name: "taro",
      password: "happy", password_confirmation: "happy")
    assert Member.authenticate("taro", "happy")
  end
    
end
