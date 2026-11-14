# Red Hat's Python image, built to run safely on OpenShift
FROM registry.access.redhat.com/ubi9/python-312

# Install the libraries first (this step gets cached, so rebuilds are faster)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY app.py .

# OpenShift prefers port 8080, and apps there can't use ports below 1024
EXPOSE 8080

# Start the app with gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]