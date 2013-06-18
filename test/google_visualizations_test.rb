require 'test_helper'

class GoogleVisualizationsTest < ActiveSupport::TestCase

   setup do
      @mock = Object.new
      @mock.extend(GoogleVisualizations::Tableable)
      @mock.cols_def = {
         "dateplaced" => {id:"A", label: "Date Placed", type: "datetime"},
         "profit" => {id:"B", label: "Profit", type: "number"}
      }
   end

   test "discrete_with_cols" do
      assert_equal @mock.discrete_with_cols({}, ["dateplaced", "profit"]).to_s,
         '{:cols=>[{:id=>"A", :label=>"Date Placed", :type=>"datetime"}, {:id=>"B", :label=>"Profit", :type=>"number"}], :rows=>[]}'
   end

   test "continuous_with_cols" do
      assert_equal @mock.continuous_with_cols({}, ["dateplaced", "profit"]).to_s,
         '{:cols=>[{:id=>"A", :label=>"Date Placed", :type=>"datetime"}, {:id=>"B", :label=>"Profit", :type=>"number"}], :rows=>[]}'
   end

   test "format_datetime_mmyy" do
      assert_equal @mock.format_datetime_mmyy(Time.new(2013, 06, 30)), "06/13"
   end

   test "format_datetime_continuous" do
      assert_equal @mock.format_datetime_continuous(Time.new(2013, 06, 30, 2, 2, 2)), 
         "Date(2013, 5, 30,  2, 02, 02)"
   end

   test "cumul_col_def" do
      assert_equal @mock.cumul_col_def("sport").to_s, 
         '{:id=>"cumulation(col)", :label=>"Sport Cumulation", :type=>"number"}'
   end

   test "hashes_to_table" do
      assert_equal @mock.hashes_to_table({}, ["dateplaced", "profit"]).to_s, 
         '{:cols=>[{:id=>"A", :label=>"Date Placed", :type=>"datetime"}, {:id=>"B", :label=>"Profit", :type=>"number"}], :rows=>[]}'
   end

end
