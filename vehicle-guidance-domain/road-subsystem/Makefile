# Directories
SRC_DIR := source
OUT_DIR := .

# Target PDFs
PDF_FILES := road_Starr.pdf road_xUML.pdf

# Default target (build all PDFs)
all: $(PDF_FILES)

# Explicit rule for road_Starr.pdf
road_Starr.pdf: $(SRC_DIR)/road.xcm $(SRC_DIR)/road_Starr.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/road.xcm -l $(SRC_DIR)/road_Starr.mls -d $@

# Explicit rule for road_xUML.pdf
road_xUML.pdf: $(SRC_DIR)/road.xcm $(SRC_DIR)/road_xUML.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/road.xcm -l $(SRC_DIR)/road_xUML.mls -d $@

# Clean up generated PDFs
clean:
	rm -f $(PDF_FILES)