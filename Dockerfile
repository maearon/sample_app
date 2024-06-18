# Use the official Ruby image from Docker Hub
FROM ruby:3.3.3

# Set the working directory inside the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile

# Install bundler and dependencies
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

# Copy the rest of the application code
COPY . .

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
