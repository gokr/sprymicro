# Spry Micro Language interpreter demo

import spryvm/spryvm
import spryvm/sprycore

# Just run an embedded string and verify it did the right thing
var spry = newInterpreter()

# We need core or otherwise we do not even have "+"
spry.addCore()

# Add two integers together and verify the result
assert (IntVal(spry.eval("[3 + 4]")).value == 7)
