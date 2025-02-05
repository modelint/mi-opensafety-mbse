# Directories
SRC_DIR := source
OUT_DIR := .

# Target PDFs
PDF_FILES := intersection_Starr.pdf intersection_xUML.pdf

# Default target (build all PDFs)
all: $(PDF_FILES)

# Explicit rule for intersection_Starr.pdf
intersection_Starr.pdf: $(SRC_DIR)/intersection.xcm $(SRC_DIR)/intersection_Starr.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/intersection.xcm -l $(SRC_DIR)/intersection_Starr.mls -d $@

# Explicit rule for intersection_xUML.pdf
intersection_xUML.pdf: $(SRC_DIR)/intersection.xcm $(SRC_DIR)/intersection_xUML.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/intersection.xcm -l $(SRC_DIR)/intersection_xUML.mls -d $@

# Clean up generated PDFs
clean:
	rm -f $(PDF_FILES)