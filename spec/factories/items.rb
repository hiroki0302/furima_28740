FactoryBot.define do
  factory :item do
    name                            {"バッグ"}
    description                     {"使いやすい"}
    category_id                     {1}
    state_id                        {1}
    burden_of_delivery_charge_id    {1}
    ship_to_region_id               {1}
    day_to_ship_id                  {1}
    price                           {10000}
  end
end
