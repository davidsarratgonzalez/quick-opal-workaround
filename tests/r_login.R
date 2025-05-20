# Install the DSI and DSOpal packages if they are not installed
if (!require("DSI")) install.packages("DSI")
if (!require("DSOpal")) install.packages("DSOpal")

# Load the DSI and DSOpal packages
library(DSI)
library(DSOpal)

# Define login details
builder <- DSI::newDSLoginBuilder()
builder$append(
  server = "local",
  driver = "OpalDriver",
  url = "https://localhost:8443",
  user = "administrator",
  password = "password"
)

# Create the login data frame
logindata <- builder$build()

# Login to the Opal server
connections <- datashield.login(logins = logindata, assign = TRUE)

# Check the connection
print(connections)

# Don't forget to logout when done
datashield.logout(connections)
