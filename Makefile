# Directories
MODEL_SRC := vehicle-guidance-domain/model-source
MODEL_OUT := vehicle-guidance-domain/model-diagrams

# Find all .xcm files in the model-source directory
XCM_FILES := $(wildcard $(MODEL_SRC)/*.xcm)

# Find all .mls files in the model-source directory
MLS_FILES := $(wildcard $(MODEL_SRC)/*_Starr.mls $(MODEL_SRC)/*_xUML.mls)

# Extract prefixes (basename without extension)
PREFIXES := $(basename $(notdir $(XCM_FILES)))

# Generate PDF filenames by replacing .mls with .pdf and changing directory
PDF_FILES := $(MLS_FILES:$(MODEL_SRC)/%.mls=$(MODEL_OUT)/%.pdf)

# The default target
all: $(PDF_FILES)

# Rule to generate PDFs
$(MODEL_OUT)/%.pdf: $(MODEL_SRC)/%.mls | $(MODEL_OUT)
	# Extract prefix from .mls filename
	PREFIX=$$(basename $* | sed -E 's/(_Starr|_xUML)//'); \
	XCM_FILE=$(MODEL_SRC)/$${PREFIX}.xcm; \
	if [ -f $$XCM_FILE ]; then \
		echo "Running flatland for $$XCM_FILE and $<"; \
		flatland -m $$XCM_FILE -l $< -d $@; \
	else \
		echo "Warning: No matching .xcm file for $<"; \
	fi

# Ensure output directory exists
$(MODEL_OUT):
	mkdir -p $@

# Clean generated PDFs
clean:
	rm -f $(PDF_FILES)