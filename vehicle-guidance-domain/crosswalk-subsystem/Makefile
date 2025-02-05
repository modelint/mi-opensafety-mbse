# Directories
SRC_DIR := source
OUT_DIR := .

# Target PDFs
PDF_FILES := crosswalk_Starr.pdf crosswalk_xUML.pdf

# Default target (build all PDFs)
all: $(PDF_FILES)

# Explicit rule for crosswalk_Starr.pdf
crosswalk_Starr.pdf: $(SRC_DIR)/crosswalk.xcm $(SRC_DIR)/crosswalk_Starr.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/crosswalk.xcm -l $(SRC_DIR)/crosswalk_Starr.mls -d $@

# Explicit rule for crosswalk_xUML.pdf
crosswalk_xUML.pdf: $(SRC_DIR)/crosswalk.xcm $(SRC_DIR)/crosswalk_xUML.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/crosswalk.xcm -l $(SRC_DIR)/crosswalk_xUML.mls -d $@

# Clean up generated PDFs
clean:
	rm -f $(PDF_FILES)