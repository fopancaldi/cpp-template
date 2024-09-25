# Stop the program at the first error
set -e

# Install the necessary programs
apt-get install -y \
    g++ \
    cmake \
    clang-format \
    git \
    doxygen \
    graphviz

# For generating latex documentation with doxygen, texlive and ghostscript also need to be installed
# See https://www.doxygen.nl/manual/install.html for more info
