#!/bin/bash

echo "====================="
echo "= AWS AUTHENTICATOR ="
echo "====================="

# ../../alpine/scripts/check-var.sh 
bash ../../alpine/scripts/check-var.sh "AWS_SECRET_GREEEE"
# images/alpine/scripts/check-var.sh
ls ../..
pwd

echo "complete"

# #!/bin/bash

# # Specify the environment variable to check
# variable_name="MY_VARIABLE"

# # Check if the variable exists
# if [ -v "$variable_name" ]; then
#     # Check if the variable is set to a non-empty value
#     if [[ -n "$variable_name" ]]; then
#         echo "The variable $variable_name is set to: $variable_name"
#     else
#         echo "The variable $variable_name exists but is empty."
#     fi
# else
#     echo "The variable $variable_name does not exist."
# fi

# # Optional: Echo "okay" in all cases as the final action
# echo "okay"