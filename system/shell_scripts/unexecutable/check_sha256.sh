#!/bin/bash

package_sha256=$(sha256sum <path-to-package> | awk '{ print $1 }')

expected_sha256=$(awk '{ print $1 }' <path-to-sha256-file>)

if [ "$package_sha256" == "$expected_sha256" ]; then
    echo "The package is normal and the authentication has been successful"
else
    echo "The verification failed. The values are not in line"
fi
