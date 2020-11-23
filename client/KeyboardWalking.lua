---------------
--By Hallkezz--
---------------

-----------------------------------------------------------------------------------
--Default Settings
local debug = false -- ON/OFF Debug mode ( Use: true/false )
---------------------
local active = true -- Enable after module load ( Use: true/false )
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--Script
class 'KeyboardWalking'

function KeyboardWalking:__init()
    Events:Subscribe( "KeyboardWalking", self, self.KeyboardWalkingToggle )

    if active then
        if debug then
            print( "KeyboardWalking enabled." )
        end
        if not self.InputPollEvent then
            self.InputPollEvent = Events:Subscribe( "InputPoll", self, self.InputPoll )
            if debug then
                print( "Event subscribe completed." )
            end
        end
    end
end

function KeyboardWalking:KeyboardWalkingToggle( args )
    if args.active then
        if debug then
            print( "KeyboardWalking enabled." )
        end
        if not self.InputPollEvent then
            self.InputPollEvent = Events:Subscribe( "InputPoll", self, self.InputPoll )
            if debug then
                print( "Event subscribe completed." )
            end
        end
    else
        if debug then
            print( "KeyboardWalking disabled." )
        end
        if self.InputPollEvent then
            Events:Unsubscribe( self.InputPollEvent )
            self.InputPollEvent = nil
            if debug then
                print( "Event unsubscribe completed." )
            end
        end
    end
end

function KeyboardWalking:InputPoll()
    if Input:GetValue( Action.StuntJump ) == 0 then
        Input:SetValue( Action.Walk, 0 )
    else
        Input:SetValue( Action.Walk, 1 )
    end
end

keyboardwalking = KeyboardWalking()

-----------------------------------------------------------------------------------
--Script Version
--v0.1--

--Release Date
--23.11.20--
-----------------------------------------------------------------------------------