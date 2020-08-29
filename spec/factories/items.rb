FactoryBot.define do
  factory :items do
    nama                          {"メンズ"}
    descripton                    {"良質な皮を使用し作られている"}
    category                      {"バッグ"}
    state                         {"新品、未使用"}
    burden_of_delivery_charge     {"着払い(購入者負担)"}
    ship_to_region                {"北海道"}
    day_to_ship                   {"1~2日で発送"}
    price                         {"10000"}
  end
end