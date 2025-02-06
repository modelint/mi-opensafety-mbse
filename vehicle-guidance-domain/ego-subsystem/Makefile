# Directories
SRC_DIR := source
OUT_DIR := .

# Target PDFs
PDF_FILES := ego_Starr.pdf ego_xUML.pdf dlc.pdf ela.pdf mlm.pdf evtrav.pdf pm.pdf \
				protected-traversal.pdf turn-after-stop.pdf yielding-traversal.pdf

# Default target (build all PDFs)
all: $(PDF_FILES)

# Explicit rule for ego_Starr.pdf
ego_Starr.pdf: $(SRC_DIR)/ego.xcm $(SRC_DIR)/ego_Starr.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/ego.xcm -l $(SRC_DIR)/ego_Starr.mls -d $@

# Explicit rule for ego_xUML.pdf
ego_xUML.pdf: $(SRC_DIR)/ego.xcm $(SRC_DIR)/ego_xUML.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/ego.xcm -l $(SRC_DIR)/ego_xUML.mls -d $@

dlc.pdf: $(SRC_DIR)/dlc.xsm $(SRC_DIR)/dlc.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/dlc.xsm -l $(SRC_DIR)/dlc.mls -d $@

ela.pdf: $(SRC_DIR)/ela.xsm $(SRC_DIR)/ela.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/ela.xsm -l $(SRC_DIR)/ela.mls -d $@

mlm.pdf: $(SRC_DIR)/mlm.xsm $(SRC_DIR)/mlm.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/mlm.xsm -l $(SRC_DIR)/mlm.mls -d $@

evtrav.pdf: $(SRC_DIR)/evtrav.xsm $(SRC_DIR)/evtrav.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/evtrav.xsm -l $(SRC_DIR)/evtrav.mls -d $@

pm.pdf: $(SRC_DIR)/pm.xsm $(SRC_DIR)/pm.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/pm.xsm -l $(SRC_DIR)/pm.mls -d $@

protected-traversal.pdf: $(SRC_DIR)/protected-traversal.xsm $(SRC_DIR)/protected-traversal.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/protected-traversal.xsm -l $(SRC_DIR)/protected-traversal.mls -d $@

turn-after-stop.pdf: $(SRC_DIR)/turn-after-stop.xsm $(SRC_DIR)/turn-after-stop.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/turn-after-stop.xsm -l $(SRC_DIR)/turn-after-stop.mls -d $@

yielding-traversal.pdf: $(SRC_DIR)/yielding-traversal.xsm $(SRC_DIR)/yielding-traversal.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/yielding-traversal.xsm -l $(SRC_DIR)/yielding-traversal.mls -d $@

# Clean up generated PDFs
clean:
	rm -f $(PDF_FILES)