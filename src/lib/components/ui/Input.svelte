<script lang="ts">
  interface Props {
    type?: "text" | "email" | "password" | "number" | "tel" | "url" | "search";
    value?: string | number;
    placeholder?: string;
    size?: "xs" | "sm" | "md" | "lg";
    bordered?: boolean;
    ghost?: boolean;
    primary?: boolean;
    secondary?: boolean;
    accent?: boolean;
    info?: boolean;
    success?: boolean;
    warning?: boolean;
    error?: boolean;
    disabled?: boolean;
    class?: string;
    id?: string;
    name?: string;
    required?: boolean;
    oninput?: (e: Event) => void;
  }

  const SIZE_CLASS: Record<NonNullable<Props["size"]>, string> = {
    xs: "input-xs",
    sm: "input-sm",
    md: "input-md",
    lg: "input-lg",
  };

  let {
    type = "text",
    value = $bindable(""),
    placeholder = "",
    size = "md",
    bordered = true,
    ghost = false,
    primary = false,
    secondary = false,
    accent = false,
    info = false,
    success = false,
    warning = false,
    error = false,
    disabled = false,
    class: className = "",
    id,
    name,
    required = false,
    oninput,
    ...rest
  }: Props = $props();

  const classes = $derived(
    [
      "input",
      bordered && "input-bordered",
      ghost && "input-ghost",
      primary && "input-primary",
      secondary && "input-secondary",
      accent && "input-accent",
      info && "input-info",
      success && "input-success",
      warning && "input-warning",
      error && "input-error",
      SIZE_CLASS[size],
      className,
    ]
      .filter(Boolean)
      .join(" ")
  );
</script>

<input
  {type}
  bind:value
  {placeholder}
  {disabled}
  {id}
  {name}
  {required}
  {oninput}
  class={classes}
  {...rest}
/>
