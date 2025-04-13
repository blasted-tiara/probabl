local function model(attributes)
    local model_name = attributes.name
    local count = tonumber(attributes.count)
    
    return function (body)
        for i = 1, count, 1 do
            print(model_name .. " #" .. i)
            print("----------------")
            
            for name, value in pairs(body) do
                print (name .. ": " .. value() ) 
            end

            print("----------------")
            print("\n")
        end
    end
end

local function enum(values)
    return function()
        local total_sum = 0

        for _, value in pairs(values) do
            total_sum = total_sum + value
        end
        
        local threshold = math.random() * total_sum
        
        local running_sum = 0
        for name, value in pairs(values) do
            if running_sum + value >= threshold then
                return name
            else
                running_sum = running_sum + value
            end
        end 
    end
end

model { name = "Bear", count = 2 } {
    Hat = enum {
        RED = 50,
        BLUE = 50
    },
    Shirt = enum {
        Metallica = 33,
        White_t = 33,
        Super_Dave_Osborne = 33
    }
} --> '[{ name: "Bear #1", Hat: "RED", Shirt: Metallica }, { name" "Bear #1", }]'