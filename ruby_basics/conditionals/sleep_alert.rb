status = ['awake', 'tired'].sample

action =  if status == 'awake'
            "Be productive!"
          else
            'Go to sleep!'
          end

puts action