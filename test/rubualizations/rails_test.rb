require 'test_helper'

class Rubualizations::RailsTest < ActiveSupport::TestCase

   setup do
      @mock = Object.new
      @mock.extend(Rubualizations::Rails::Tableable)
      @mock.cols_def = {
         "dateplaced" => {id:"A", label: "Date Placed", type: "datetime"},
         "profit" => {id:"B", label: "Profit", type: "number"}
      }
   end

   test "tabelize" do
      assert_equal @mock.tablize_hashes([], {cols:"dateplaced,profit"}).to_s,
         '{:cols=>[{:id=>"A", :label=>"Date Placed", :type=>"datetime"}, {:id=>"B", :label=>"Profit", :type=>"number"}], :rows=>[]}'
   end

end
