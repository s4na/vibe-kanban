-- Add execution environment option to projects and task attempts
ALTER TABLE projects ADD COLUMN execution_environment TEXT NOT NULL DEFAULT 'host' CHECK (execution_environment IN ('host', 'container'));
ALTER TABLE task_attempts ADD COLUMN execution_environment TEXT NOT NULL DEFAULT 'host' CHECK (execution_environment IN ('host', 'container'));

-- Add container configuration to projects
ALTER TABLE projects ADD COLUMN container_image TEXT;
ALTER TABLE projects ADD COLUMN container_volumes TEXT; -- JSON array of volume mappings
ALTER TABLE projects ADD COLUMN container_environment TEXT; -- JSON object of environment variables